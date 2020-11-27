//
//  KVO.m
//  Runtime
//
//  Created by tigerfly on 2020/11/20.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "KVO.h"

@interface KVO ()

@end

@implementation KVO

//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html#//apple_ref/doc/uid/10000177-BCICJDHA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark -- Introduction to Key-Value Observing Programming Guide

    /*
     Key-value observing is a mechanism that allows objects to be notified
     of changes to specified properties of other objects.
     
     ⚠️ In order to understand key-value observing, you must first
     understand key-value coding.
     */
    
    /**
     Key-value observing provides a mechanism that allows objects
     to be notified of changes to specific properties of other objects.
     It is particularly useful for communication between model
     and controller layers in an application. (In OS X, the controller
     layer binding technology relies heavily on key-value observing.)
     A controller object typically observes properties of model objects,
     and a view object observes properties of model object through a
     controller. In addition, however, a model object may observe other
     model objects(usually to determine when a dependent value changes)
     or even itself (again to determine when a dependent value changes).
     
     You can observe properties including simple attributes, to-one
     relationships, and to-mamy relationships. Observes of to-many
     relationship are informed of the type of change made -- as well
     as which objects are involved in the change.
     
     A simple example illustrates how KVO can be useful in your
     application. Suppose a Person object interacts with an Account
     object, representing the person's savings account at a bank.
     An instance of Person may need to be aware of when certain
     aspects of the Account instance change, such as the balance,
     or the interest rate.
     
     If these attributes are public properties of Account, the Person
     could periodically poll the Account to discover changes, but
     this is of course inefficient, and often impractical. A better
     approach is to use KVO, which is akin to Person receiving an
     interrupt when a change occurs.
     
     To use KVO, first you must ensure that the observed object,
     the Account in this case, is KVO compliant. Typically, if your
     objects inherit from NSObject and you create properties in the
     usual way, your objects and their properties will automatically
     be KVO Compliant. It is also possible to implement compliance
     manually. KVO Compliance describles the difference between
     automatic and manual key-value observing, and how to implement
     both.
     
     Next, you must register your observer instance, the Person,
     with the observed instance, the Account.Person sends an
     addObserver:forKeyPath:options:context: message to the Account,
     once for each observed key path, naming itself as the observer.
     
     In order to receive change notifications from the Account,
     Person implements the observeValueForKeyPath:ofObject:change:
     context: method, required of all observers. The Account will
     send this message to the Person any time one of the registered
     key paths changes. The Person can then take appropriate action
     based upon the change notification.
     
     Finally, when it no longer wants notifications, and at the very
     least before it is deallocated, the Person instance must
     de-register by sending the message removeObserver:forKeyPath:
     to the Account.
     
     Registering for key-Value observing describles the full lifecycle
     of registering for, receiving, and de-registering for key value
     observation notifications.
     
     KVO's primary benefit is that you don't have to implement your
     own scheme to send notifications every time a property changes.
     Its well-defined infrasturcture has framework-level support
     that makes it easy to adopt -- typically you do not have to
     add any code to your project. In addition, the infrastructure
     is already full-featured, which makes it easy to support
     multiple observes for a single property, as well as dependent
     values.
     
     Registering Dependent Keys explains how to specify that the
     value of a key is dependent on the value of another key.
     
     Unlike notifications that use NSNotificationCenter, there is
     no central object that provides change notification for all
     observers. Instead, notifications are sent directly to the
     observing objects when changes are made. NSObject provides
     this base implementation of key-value observing, and you
     should rarely need to override these methods.
     
     Key-Value observing Implementation Details describles how
     key-value observing is implemented.
     */
    
    
#pragma mark --  Registering for Key-Value Observing
    
    /*
     You must perform the following steps to enable an object to
     receive key-value observing notifications for a KVO-compliant
     property:
     
     •  Register the observer with the observed object using the method.
        addObserver:forKeyPath:Options:context:.
     •  Implement observeValueForKeyPath:ofObject:change:context: inside
        the observer to accept change notification messages.
     •  Unregister the observer using the method removeObserver:forKeyPath:
        when it no longer should receive messages. At a minimum, invoke
        this method before the observer is released from memory.
     ⚠️ Not all classes are KVO-compliant for all properties. You can
        ensure your own classes are KVO-compliant by following the steps
        describled in KVO Compliance. Typically properties in
        Apple-supplied frameworks are only KVO-compliant if they are
        documented as such.
     */
    
    /**
     Registering as an Observer
     
     An observing object first registers itself with the observed object
     by sending an addObserver:forKeyPath:options:context:message,passing
     itself as the observer and the key path of the property to be observed.
     The observer additionally specifies an options parameter and a context
     pointer to manage aspects of the notifications.
     
     ========Options===========
     The Options parameter, specified as a bitwise OR of option constants,
     affects both the content of the change dictionary supplied in the
     notification, and the manner in which notifications are generated.
     
     You opt to receive the value of the observed property from before
     the change by specifying option NSKeyValueObservingOptionOld. You
     request the new value of the property with option
     NSKeyValueObservingOptionNew. You receive both old and new values
     with the bitwise OR of these options.
     
     You instruct the observed object to send an immediate change notification
     (before addObserver:forKeyPath:Option:context: returns) with the
     option NSKeyValueObservingOptionInitial. You can use this additional,
     one-time notification to establish the initial value of a property
     in the observer.
     
     You instruct the observed object to send a notification just prior
     to a property change(in addition to the usual notification just
     after the change) by including the option NSKeyValueObservingOptionPrior.
     The change dictionary represents a prechange notification by including
     the key NSKeyValueChangeNotificationIsPriorKey With the value of an
     NSNumber wrapping YES. That key is not otherwise present. You can
     use the prechange notification when the observer's own KVO compliance
     requires it to invoke one of the -willChange- methods for one of
     its properties that depends on an observed property. The usual
     post-change notification comes too late to invoke ..willChange..
     in time.
     
     ========Context===========
     The context pointer in the addObserver:forKeyPath:options:context:
     message contains arbitrary data that will be passed back to the
     observer in the corresponding change notifications. You may
     specify NULL and rely entirely on the key Path string to
     determine the origin of a change notification, but this approach
     may cause problems for an Object whose superclass is also
     observing the same key path for different reasons.
     
     A safer and more extensible approach is to use the context to
     ensure notificationsd you receive are destined for your observer
     and not a superclass.
     
     The address of a uniquely named static variable within your class
     makes a good context. Contexts chosen in a similar manner in the
     super- or subclass will be unlikely to overlap. You may choose
     a single context for the entire class and rely on the key path
     string in the notification message to determine what changed.
     Alternatively, you may create a distinct context for each
     observed key path, which bypasses the need for string
     comparisons entirely, resulting in more efficient notification
     parsing.
     ==============================================================
     Listing 1  Creating context pointers
     static void *PersonAccountBalanceContext = &PersonAccountBalanceContext;
     static void *PersonAccountInterestRateContext = &PersonAccountInterestRateContext;
     ==============================================================

     The example in Listing 2 demonstrates how a Person instance
     registers itself as an observer for an Account instance’s
     balance and interestRate properties using the given context pointers.
     ==============================================================
     - (void)registerAsObserverForAccount:(Account*)account {
         [account addObserver:self
                   forKeyPath:@"balance"
                      options:(NSKeyValueObservingOptionNew |
                               NSKeyValueObservingOptionOld)
                      context:PersonAccountBalanceContext];
      
         [account addObserver:self
                   forKeyPath:@"interestRate"
                      options:(NSKeyValueObservingOptionNew |
                               NSKeyValueObservingOptionOld)
                       context:PersonAccountInterestRateContext];
     }
     ==============================================================

     ⚠️ The key-value observing addObserver:forKeyPath:options:context:
     method does not maintain strong references to the observing object,
     the observed objects, or the context. You should ensure that you
     maintain strong references to the observing, and observed, objects,
     and the context as necessary.
     */
    
    /**
     Receiving Notification of a Change

     When the value of an observed property of an object changes,
     the observer receives an observeValueForKeyPath:ofObject:change:context:
     message. All observers must implement this method.

     The observing object provides the key path that triggered
     the notification, itself as the relevant object, a dictionary
     containing details about the change, and the context pointer
     that was provided when the observer was registered for this key path.

     The change dictionary entry NSKeyValueChangeKindKey provides
     information about the type of change that occurred. If the
     value of the observed object has changed, the
     NSKeyValueChangeKindKey entry returns NSKeyValueChangeSetting.
     Depending on the options specified when the observer was
     registered, the NSKeyValueChangeOldKey and NSKeyValueChangeNewKey
     entries in the change dictionary contain the values of the
     property before, and after, the change. If the property is
     an object, the value is provided directly. If the property
     is a scalar or a C structure, the value is wrapped in an
     NSValue object (as with key-value coding).

     If the observed property is a to-many relationship, the
     NSKeyValueChangeKindKey entry also indicates whether
     objects in the relationship were inserted, removed, or
     replaced by returning NSKeyValueChangeInsertion,
     NSKeyValueChangeRemoval, or NSKeyValueChangeReplacement,
     respectively.

     The change dictionary entry for NSKeyValueChangeIndexesKey
     is an NSIndexSet object specifying the indexes in the
     relationship that changed. If NSKeyValueObservingOptionNew
     or NSKeyValueObservingOptionOld are specified as options
     when the observer is registered, the NSKeyValueChangeOldKey
     and NSKeyValueChangeNewKey entries in the change dictionary
     are arrays containing the values of the related objects
     before, and after, the change.

     The example in Listing 3 shows the observeValueForKeyPath:
     ofObject:change:context: implementation for the Person
     observer that logs the old and new values of the properties
     balance and interestRate, as registered in Listing 2.
     ==============================================================
     Listing 3  Implementation of observeValueForKeyPath:ofObject:change:context:
     - (void)observeValueForKeyPath:(NSString *)keyPath
                           ofObject:(id)object
                             change:(NSDictionary *)change
                            context:(void *)context {
      
         if (context == PersonAccountBalanceContext) {
             // Do something with the balance…
      
         } else if (context == PersonAccountInterestRateContext) {
             // Do something with the interest rate…
      
         } else {
             // Any unrecognized context must belong to super
             [super observeValueForKeyPath:keyPath
                                  ofObject:object
                                    change:change
                                    context:context];
         }
     }
     ==============================================================

     If you specified a NULL context when registering an
     observer, you compare the notification’s key path against
     the key paths you are observing to determine what has changed.
     If you used a single context for all observed key paths, you
     first test that against the notification’s context, and finding
     a match, use key path string comparisons to determine what
     specifically has changed. If you have provided a unique context
     for each key path, as demonstrated here, a series of simple
     pointer comparisons tells you simultaneously whether or not
     the notification is for this observer, and if so, what key
     path has changed.

     In any case, the observer should always call the superclass’s
     implementation of observeValueForKeyPath:ofObject:change:context:
     when it does not recognize the context (or in the simple case,
     any of the key paths), because this means a superclass has
     registered for notifications as well.

     ⚠️ If a notification propagates to the top of the class
     hierarchy, NSObject throws an NSInternalInconsistencyException
     because this is a programming error: a subclass failed to
     consume a notification for which it registered.

     */
    
    /**
     Removing an Object as an Observer
     
     You remove a key-value observer by sending the observed object
     a removeObserver:forKeyPath:context: message, specifying the
     observing object, the key path, and the context. The example
     in Listing 4 shows Person removing itself as an observer of
     balance and interestRate.
     ==============================================================
     Listing 4  Removing the inspector as an observer of balance and interestRate
     - (void)unregisterAsObserverForAccount:(Account*)account {
         [account removeObserver:self
                      forKeyPath:@"balance"
                         context:PersonAccountBalanceContext];
      
         [account removeObserver:self
                      forKeyPath:@"interestRate"
                         context:PersonAccountInterestRateContext];
     }
     ==============================================================
     
     After receiving a removeObserver:forKeyPath:context: message,
     the observing object will no longer receive any
     observeValueForKeyPath:ofObject:change:context: messages
     for the specified key path and object.

     When removing an observer, keep several points in mind:
     
     •  Asking to be removed as an observer if not already
        registered as one results in an NSRangeException. You
        either call removeObserver:forKeyPath:context: exactly
        once for the corresponding call to addObserver:forKeyPath:
        options:context:, or if that is not feasible in your app,
        place the removeObserver:forKeyPath:context: call inside a
        try/catch block to process the potential exception.
     
     •  An observer does not automatically remove itself when
        deallocated. The observed object continues to send notifications,
        oblivious to the state of the observer. However, a change
        notification, like any other message, sent to a released
        object, triggers a memory access exception. You therefore
        ensure that observers remove themselves before disappearing
        from memory.
     
     •  The protocol offers no way to ask an object if it is an
        observer or being observed. Construct your code to avoid
        release related errors. A typical pattern is to register as
        an observer during the observer’s initialization (for example
        in init or viewDidLoad) and unregister during deallocation
        (usually in dealloc), ensuring properly paired and ordered
        add and remove messages, and that the observer is unregistered
        before it is freed from memory.
     */
    
    
#pragma mark -- KVO Compliance

    /*
     In order to be considered KVO-compliant for a specific property,
     a class must ensure the following:

     •  The class must be key-value coding compliant for the property,
        as specified in Ensuring KVC Compliance.
        KVO supports the same data types as KVC, including Objective-C
        objects and the scalars and structures listed in Scalar and
        Structure Support.
     •  The class emits KVO change notifications for the property.
     •  Dependent keys are registered appropriately (see Registering
        Dependent Keys).
     There are two techniques for ensuring the change notifications
     are emitted.  Automatic support is provided by NSObject and is
     by default available for all properties of a class that are
     key-value coding compliant. Typically, if you follow standard
     Cocoa coding and naming conventions, you can use automatic
     change notifications—you don’t have to write any additional code.

     Manual change notification provides additional control over
     when notifications are emitted, and requires additional
     coding. You can control automatic notifications for
     properties of your subclass by implementing the class
     method automaticallyNotifiesObserversForKey:.
     */

    /**
     Automatic Change Notification

     NSObject provides a basic implementation of automatic
     key-value change notification. Automatic key-value change
     notification informs observers of changes made using key-value
     compliant accessors, as well as the key-value coding methods.
     Automatic notification is also supported by the collection
     proxy objects returned by, for example,
     mutableArrayValueForKey:.

     The examples shown in Listing 1 result in any observers of
     the property name to be notified of the change.
     ==============================================================
     Listing 1  Examples of method calls that cause KVO change
     notifications to be emitted

     // Call the accessor method.
     [account setName:@"Savings"];
      
     // Use setValue:forKey:.
     [account setValue:@"Savings" forKey:@"name"];
      
     // Use a key path, where 'account' is a kvc-compliant property of 'document'.
     [document setValue:@"Savings" forKeyPath:@"account.name"];
      
     // Use mutableArrayValueForKey: to retrieve a relationship proxy object.
     Transaction *newTransaction = <#Create a new transaction for the account#>;
     NSMutableArray *transactions = [account mutableArrayValueForKey:@"transactions"];
     [transactions addObject:newTransaction];
     ==============================================================
     */
    
    /**
     Manual Change Notification


     In some cases, you may want control of the notification
     process, for example, to minimize triggering notifications
     that are unnecessary for application specific reasons, or
     to group a number of changes into a single notification.
     Manual change notification provides means to do this.

     Manual and automatic notifications are not mutually exclusive.
     You are free to issue manual notifications in addition to
     the automatic ones already in place. More typically, you
     may want to completely take control of the notifications
     for a particular property. In this case, you override the
     NSObject implementation of automaticallyNotifiesObserversForKey:.
     For properties whose automatic notifications you want to
     preclude, the subclass implementation of
     automaticallyNotifiesObserversForKey: should return NO.
     A subclass implementation should invoke super for any unrecognized
     keys. The example in Listing 2 enables manual notification for
     the balance property, allowing the superclass to determine
     the notification for all other keys.
     ==============================================================
     Listing 2  Example implementation of automaticallyNotifiesObserversForKey:

     + (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey {
      
         BOOL automatic = NO;
         if ([theKey isEqualToString:@"balance"]) {
             automatic = NO;
         }
         else {
             automatic = [super automaticallyNotifiesObserversForKey:theKey];
         }
         return automatic;
     }
     ==============================================================

     To implement manual observer notification, you invoke
     willChangeValueForKey: before changing the value, and
     didChangeValueForKey: after changing the value. The
     example in Listing 3 implements manual notifications
     for the balance property.
     ==============================================================
     Listing 3  Example accessor method implementing manual notification

     - (void)setBalance:(double)theBalance {
         [self willChangeValueForKey:@"balance"];
         _balance = theBalance;
         [self didChangeValueForKey:@"balance"];
     }
     ==============================================================
     You can minimize sending unnecessary notifications
     by first checking if the value has changed. The example
     in Listing 4 tests the value of balance and only provides
     the notification if it has changed.
     ==============================================================
     Listing 4  Testing the value for change before providing notification

     - (void)setBalance:(double)theBalance {
         if (theBalance != _balance) {
             [self willChangeValueForKey:@"balance"];
             _balance = theBalance;
             [self didChangeValueForKey:@"balance"];
         }
     }
     ==============================================================

     If a single operation causes multiple keys to change you
     must nest the change notifications as shown in Listing 5.
     ==============================================================
     Listing 5  Nesting change notifications for multiple keys

     - (void)setBalance:(double)theBalance {
         [self willChangeValueForKey:@"balance"];
         [self willChangeValueForKey:@"itemChanged"];
         _balance = theBalance;
         _itemChanged = _itemChanged+1;
         [self didChangeValueForKey:@"itemChanged"];
         [self didChangeValueForKey:@"balance"];
     }
     ==============================================================

     In the case of an ordered to-many relationship, you must
     specify not only the key that changed, but also the type
     of change and the indexes of the objects involved. The
     type of change is an NSKeyValueChange that specifies
     NSKeyValueChangeInsertion, NSKeyValueChangeRemoval, or
     NSKeyValueChangeReplacement. The indexes of the affected
     objects are passed as an NSIndexSet object.

     The code fragment in Listing 6 demonstrates how to wrap
     a deletion of objects in the to-many relationship transactions.
     ==============================================================
     Listing 6  Implementation of manual observer notification in a to-many relationship
     
     - (void)removeTransactionsAtIndexes:(NSIndexSet *)indexes {
         [self willChange:NSKeyValueChangeRemoval
             valuesAtIndexes:indexes forKey:@"transactions"];
      
         // Remove the transaction objects at the specified indexes.
      
         [self didChange:NSKeyValueChangeRemoval
             valuesAtIndexes:indexes forKey:@"transactions"];
     }
     ==============================================================


     */
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
