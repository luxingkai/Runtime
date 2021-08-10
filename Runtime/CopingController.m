//
//  CopingController.m
//  Runtime
//
//  Created by tigerfly on 2020/11/17.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "CopingController.h"

@interface Orange : NSObject<NSCopying,NSMutableCopying>

@end

@implementation Orange

- (id)copyWithZone:(NSZone *)zone {
    Orange *orange = [[self class] allocWithZone:zone];
    return orange;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    Orange *orange = [[self class] allocWithZone:zone];
    return orange;
}

@end


@interface CopingController ()

@end

@implementation CopingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
#pragma mark -- NSCopying
    
    /**
     NSCopying
     
     A protocol that objects adopt to provide functional copies of themselves.
     
     The exact meaning of “copy” can vary from class to class, but a copy must
     be a functionally independent object with values identical to the original
     at the time the copy was made. A copy produced with NSCopying is implicitly
     retained by the sender, who is responsible for releasing it.
     
     NSCopying declares one method, copyWithZone:, but copying is commonly
     invoked with the convenience method copy. The copy method is defined
     for all objects inheriting from NSObject and simply invokes copyWithZone:
     with the default zone.
     
     Your options for implementing this protocol are as follows:
     
     • Implement NSCopying using alloc and init... in classes that don’t
     inherit copyWithZone:.
     • Implement NSCopying by invoking the superclass’s copyWithZone: when
     NSCopying behavior is inherited. If the superclass
     • implementation might use the NSCopyObject function, make explicit
     assignments to pointer instance variables for retained objects.
     • Implement NSCopying by retaining the original instead of creating a
     new copy when the class and its contents are immutable.
     
     If a subclass inherits NSCopying from its superclass and declares
     additional instance variables, the subclass has to override copyWithZone:
     to properly handle its own instance variables, invoking the superclass’s
     implementation first.
     */
    
    /**
     Copying
     
     - copyWithZone:
     */
    
    /**
     NSMutableCopying
     
     A protocol that mutable objects adopt to provide functional copies
     of themselves.
     
     The NSMutableCopying protocol declares a method for providing mutable
     copies of an object. Only classes that define an "immutable vs. mutable"
     distinction should adopt this protocol.Classes that don't define such a
     distinction should adopt NSCoping instead.
     
     NSMutableCopying declares one method, mutableCopyWithZone:, but mutable
     copying is commonly invoked with the convenience method mutableCopy.
     The mutableCopy method is defined for all NSObjects and simply invokes
     mutableCopyWithZone: with the default zone.
     
     If a subclass inherits NSMutableCopying from its superclass and declares
     additional instance variables, the subclass has to override
     mutableCopyWithZone: to properly handle its own instance variables,
     invoking the superclass's implementation first.
     */
    
    /**
     Copying
     
     - mutableCopyWithZone:
     */
    
    
#pragma mark -- NSCoding
    
    /*
     A protocol that enables an object to be encoded and decoded for
     for archiving and distribution.
     
     The NSCoding protocol declares the two methods that a class must
     implement so that instances of that class can be encoded and
     decoded. This capability provides the basis for archiving (
     where objects and other structures are stored on disk) and
     distribution (where objects are copied to different address
     spaces).
     
     In keeping with object-oriented design principles, an object
     being encoded or decoded is responsible for encoding and
     decoding its instance variables. A coder instructs the object
     to do so by invoking encodeWithCoder: or initWithCoder:.
     encodeWithCoder: instructs the object to encode its instance
     variables to the coder provided; an object can receive this
     method any number of times. initWithCoder: instructs the object
     to initialize itself from data in the coder provided; as such,
     it replaces any other initialization method and is sent only
     once per object. Any object class that should be codeable must
     adopt the NSCoding  protocol and implement its methods.
     
     It is important to consider the possible types of archiving
     that a coder supports. In macOS 10.2 and later, keyed
     archiving is preferred. You may, however, need to support
     classic archiving.
     */
    
    /**
     Initializing with a coder
     
     - initWithCoder:
     Returns an object initialized from data in a given unarchiver.
     Required.
     */
    
    /**
     Encoding with a coder
     
     - encodeWithCoder:
     Encodes the receiver using a given archiver.
     Required.
     */
    
    
    
#pragma mark -- NSSecureCoding
    
    /*
     A protocol that enables encoding and decoding in a manner that is
     robust against object substitution attacks.
     
     Historically, many classes decoded instances of themselves like
     this:
     =============================================================
     id obj = [decoder decodeObjectForKey:@"myKey"];
     if (![obj isKindOfClass:[MyClass class]]) { //    }
     
     this technique is potentially unsafe because by the time you
     can verify the class type, the object has already been constructed,
     and if this is part of a collection class, potentially inserted
     into an object graph.
     
     In order to conform to NSSecureCoding:
     •  An object that does not override initWithCoder: can conform
        to NSSecureCoding without any changes (assuming that it is a
        subclass of another class that conforms).
     •  An object that does override initWithCoder: must decode any
        enclosed objects using the decodeObjectOfClass:forKey: method.
        For example:
        =====================================================
        id obj = [decoder decodeObjectOfClass:[MyClass class] forKey:@"myKey"];
        =====================================================

     In addition, the class must override the getter for its
     supportsSecureCoding property to return YES.
     */
    
    /**
     Checking for Secure Coding
     
     - supportSecureCoding
     A Boolean value that indicates whether or not the class
     supports secure coding.
     Required.
     */
    
    
    
#pragma mark -- Keyed Archivers
    
    
    /*
     NSKeyedArchiver
     
     An encoder that stores an object' data to an archive referenced
     by keys.
     
     NSKeyedArchiver, a concrete subclass of NSCoder, provides a way
     to encode objects (and scalar values) into an architecture-
     independent suitable for storage in a file. When you archive
     a set of objects, the archiver writes the class information
     and instance variables for each object to the archive. The
     companion class NSKeyedUnarchiver decodes the data in an
     archive and creates a set of objects equivalent to the original
     set.
     
     A keyed archive differs from a non-keyed archive in that all
     the objects and values encoded into the archive have names,
     or keys. When decoding a non-keyed archive, the decoder must
     decode values in the same order the original encoder used.
     When decoding a keyed archive, the decoder requests values
     by name, meaning it can decode values out of sequence or
     not at all. Keyed archives, therefore, provide better support
     for forward and backward compatibility.
     
     The keys given to encoded values must be unique only within
     the scope of the currently-encoding object. A keyed archive
     is hierarchical, so the keys used by object A to encode its
     instance variables don't conflict with the keys used by object
     B. This is ture even if A and B are instances of the same class.
     Within a single object, however, the keys used by a subclass
     can conflict with keys used in its superclasses.
     
     An NSArchiver object can write the archive data to a file
     or to a mutable-data object (an instance of NSMutableData)
     that you provide.
     */
     
    /**
     Creating a Keyed Archiver
     
     - initRequiringSecureCoding:
     Creates an archiver to encode data, and optionally disables
     secure coding.
     */
    
    
    /**
     Archiving Data

     + archivedDataWithRootObject:requiringSecureCoding:error:
     Encodes an object graph with the given root object into a data
     representation, optionally requiring secure coding.
     
     - finishEncoding
     Instructs the receiver to construct the final data stream.
     
     encodedData
     The encoded data for the archiver.
     
     outputFormat
     The format in which the receiver encodes its data.
     
     requiresSecureCoding
     Indicates whether the archiver requires all archived classes to
     resist object substitution attacks.
     */
    
    
    /**
     Encoding Data and Objects
     
     - encodeBool:forKey:
     Encodes a given Boolean value and associates it with a key.
     
     - encodeBytes:length:forKey:
     Encodes a given number of bytes from a given C array of bytes and
     associates them with a key.
     
     - encodeConditionalObject:forKey:
     Encodes a reference to a given object and associates it with a key
     only if it has been unconditionally encoded elsewhere in the archive.
     
     - encodeDouble:forKey:
     Encodes a given double value and associates it with a key.
     
     - encodeFloat:forKey:
     Encodes a given float value and associates it with a key.
     
     - encodeInt:forKey:
     Encodes a given int value and associates it with a key.
     
     - encodeInt32:forKey:
     Encodes a given 32-bit integer value and associates it with a key.
     
     - encodeInt64:forKey:
     Encodes a given 64-bit integer value and associates it with a key.
     
     - encodeObject:forKey:
     Encodes a given object and associates it with a given key.
     */
    
    
    /**
     Managing the Delegate

     - delegate
     The archiver’s delegate.
     */
    
    /**
     Managing Classes and Class Names

     + setClassName:forClass:
     Sets a global translation mapping to encode instances of a given
     class with the provided name, rather than their real name.
     
     + classNameForClass:
     Returns the class name with which the archiver class encodes
     instances of a given class.
     
     - setClassName:forClass:
     Sets a mapping for this archiver to encode instances of a given
     class with the provided name, rather than their real name.
     
     - classNameForClass:
     Returns the class name with which this archiver encodes instances
     of a given class.
     */
    
    
#pragma mark -- NSKeyedUnarchiver
    
    /*
     NSKeyedUnarchiver
     
     A decoder that restores data from an archive referenced by keys.
     
     NSKeyedUnarchiver is a concrete subclass of NSCoder that defines
     methods for decoding a set of named objects (and scalar values)
     from a keyed archive. The NSKeyedArchiver class produces archives
     that this class can decode.
     
     The archiver creates keyed archive as a hierarchy of objects. The
     archiver treats each object as a namespace into which it can
     encode other objects. This means that an unarchiver can only
     decode objects encoded elsewhere in the hierarchy -- whether
     higher than, lower than, or parallel to this particular object
     -- aren't accessible. In this way, the key used by a particular
     object to encode its instance variables need to be unique only
     within the scope of that object.
     
     If you invoke one of the decode-prefixed methods of this class
     using a key that does not exist in the archive, the return value
     indicates failure. This value varies by decoded type. For example,
     if a key does not exist in an archive, decodeBoolForKey:returns
     NO, decodeIntForKey: returns 0, and decodeObjectForKey: return nil.
     
     NSKeyedUnarchiver supports limited type coercion for numeric types.
     You can use any of the integer decode methods to decode a value
     encoded as any type of integer, whether a standard int or an
     explicit 32-bit or 64-bit integer. Likewise, you can use the
     float- or double-returning decode methods to handle a value
     encoded as a float or double. If an encoded value is too large
     to fit within the coerced type, the decoding method throws a
     NSRangeException. Further, when trying to coerce a value to
     an incompatible type — for example decoding an int as a float
     — the decoding method throws an
     NSInvalidUnarchiveOperationException.
     */
    
    /**
     Creating a Keyed Unarchiver
     
     - initForReadingFromData:error:
     Initializes an archiver to decode data from the specified location.
     */
    
    /**
     Unarchiving Data
     
     + unarchivedObjectOfClass:fromData:error:
     Decodes a previously-archived object graph, that returns the
     root object as the specified type.
     
     + unarchivedObjectOfClasses:fromData:error:
     Decodes a previously-archived object graph, returning the root
     object as one of the specified classes.
     
     requiresSecureCoding
     Indicates whether the receiver requires all unarchived classes
     to conform to NSSecureCoding.
     */
    
    /**
     Decoding Data
     
     - containsValueForKey:
     Returns a Boolean value that indicates whether the
     archive contains a value for a given key within the
     current decoding scope.
     
     - decodeBoolForKey:
     Decodes a Boolean value associated with a given key.
     
     - decodeBytesForKey:returnedLength:
     Decodes a stream of bytes associated with a given key.
     
     - decodeDoubleForKey:
     Decodes a double-precision floating-point value associated
     with a given key.
     
     - decodeFloatForKey:
     Decodes a single-precision floating-point value associated
     with a given key.
     
     - decodeIntForKey:
     Decodes an integer value associated with a given key.
     
     - decodeInt32ForKey:
     Decodes a 32-bit integer value associated with a given key.
     
     - decodeInt64ForKey:
     Decodes a 64-bit integer value associated with a given key.
     
     - decodeObjectForKey:
     Decodes and returns an object associated with a given key.
     
     - finishDecoding
     Tells the receiver that you are finished decoding objects.
     
     decodingFailurePolicy
     The action to take when this unarchiver fails to decode an entry.
     */
    
    /**
     Managing the Delegate
     
     - delegate
     The receiver’s delegate.
     */
    
    /**
     Managing Class Names
     
     + setClass:forClassName:
     Sets a global translation mapping to decode objects encoded
     with a given class name as instances of a given class instead.
     
     + classForClassName:
     Returns the class from which this unarchiver instantiates an
     encoded object with a given class name.
     
     - setClass:forClassName:
     Sets a translation mapping on this unarchiver to decode objects
     encoded with a given class name as instances of a given class instead.
     
     - classForClassName:
     Returns the class from which this unarchiver instantiates an
     encoded object with a given class name.
     */
    
    /**
     Type Methods
     
     + unarchivedArrayOfObjectsOfClass:fromData:error:
     + unarchivedArrayOfObjectsOfClasses:fromData:error:
     + unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:
     + unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:
     */
    
    
#pragma mark -- NSCoder
    
    /*
     An abstract class that serves as the basis for objects that enable
     archiving and distribution of other objects.

     NSCoder declares the interface used by concrete subclasses to transfer
     objects and other values between memory and some other format. This
     capability provides the basis for archiving (storing objects and data
     on disk) and distribution (copying objects and data items between
     different processes or threads). The concrete subclasses provided by
     Foundation for these purposes are NSArchiver, NSUnarchiver,
     NSKeyedArchiver, NSKeyedUnarchiver, and NSPortCoder. Concrete
     subclasses of NSCoder are “coder classes”, and instances of these
     classes are “coder objects” (or simply “coders”). A coder that can
     only encode values is an “encoder”, and one that can only decode
     values is a “decoder”.

     NSCoder operates on objects, scalars, C arrays, structures, strings,
     and on pointers to these types. It doesn’t handle types whose
     implementation varies across platforms, such as union, void *,
     function pointers, and long chains of pointers. A coder stores
     object type information along with the data, so an object decoded
     from a stream of bytes is normally of the same class as the object
     that was originally encoded into the stream. An object can change
     its class when encoded, however; this is described in Archives
     and Serializations Programming Guide.

     The AVFoundation framework adds methods to the NSCoder class to
     make it easier to create archives including Core Media time
     structures, and extract Core Media time structure from archives.
     */
    
    
    /**
     Inspecting a Coder
     
     allowsKeyedCoding
     A Boolean value that indicates whether the receiver supports
     keyed coding of objects.
     
     - containsValueForKey:
     Returns a Boolean value that indicates whether an encoded value
     is available for a string.
     
     decodingFailurePolicy
     The action the coder should take when decoding fails.
     
     NSDecodingFailurePolicy
     Policies describing the action the coder should take when encountering
     decode failures.
     */
    
    
    /**
     Encoding General Data
     
     - encodeArrayOfObjCType:count:at:
     Encodes an array of the given Objective-C type, provided the
     number of items and a pointer.
     
     - encodeBool:forKey:
     Encodes a Boolean value and associates it with the string key.
     
     - encodeBycopyObject:
     An encoding method for subclasses to override such that it creates
     a copy, rather than a proxy, when decoded.
     
     - encodeByrefObject:
     An encoding method for subclasses to override such that it creates a
     proxy, rather than a copy, when decoded.
     
     - encodeBytes:length:
     Encodes a buffer of data of an unspecified type.
     
     - encodeBytes:length:forKey:
     Encodes a buffer of data, given its length and a pointer, and associates
     it with a string key.
     
     - encodeConditionalObject:
     An encoding method for subclasses to override to conditionally
     encode an object, preserving common references to it.
     
     - encodeConditionalObject:forKey:
     An encoding method for subclasses to override to conditionally
     encode an object, preserving common references to it, only if it
     has been unconditionally encoded.
     
     - encodeDataObject:
     Encodes a given data object.
     
     - encodeDouble:forKey:
     Encodes a double-precision floating point value and associates
     it with the string key.
     
     - encodeFloat:forKey:
     Encodes a floating point value and associates it with the string key.
     
     - encodeInt:forKey:
     Encodes a C integer value and associates it with the string key.
     
     - encodeInteger:forKey:
     Encodes an integer value and associates it with the string key.
     
     - encodeInt32:forKey:
     Encodes a 32-bit integer value and associates it with the string key.
     
     - encodeInt64:forKey:
     Encodes a 64-bit integer value and associates it with the string key.
     
     - encodeObject:
     Encodes an object.
     
     - encodeObject:forKey:
     Encodes an object and associates it with the string key.
     
     - encodePoint:
     Encodes a point.
     
     - encodePoint:forKey:
     Encodes a point and associates it with the string key.
     
     - encodePropertyList:
     Encodes a property list.
     
     - encodeRect:
     Encodes a rectangle structure.
     
     - encodeRect:forKey:
     Encodes a rectangle structure and associates it with the string key.
     
     - encodeRootObject:
     An encoding method for subclasses to override to encode an
     interconnected group of objects, starting with the provided root object.
     
     - encodeSize:
     Encodes a size structure.
     
     - encodeSize:forKey:
     Encodes a size structure and associates it with the given string key.
     
     - encodeValueOfObjCType:at:
     Encodes a value of the given type at the given address.
     
     - encodeValuesOfObjCTypes:
     Encodes a series of values of potentially differing Objective-C types.
     */
    
    
    /**
     Encoding Geometry-Based Data

     - encodeCGAffineTransform:forKey:
     Encodes an affine transform and associates it with the specified
     key in the receiver’s archive.
     
     - encodeCGPoint:forKey:
     Encodes a point and associates it with the specified key in the
     receiver’s archive.
     
     - encodeCGRect:forKey:
     Encodes a rectangle and associates it with the specified key in
     the receiver’s archive.
     
     - encodeCGSize:forKey:
     Encodes size information and associates it with the specified key
     in the coder’s archive.
     
     - encodeCGVector:forKey:
     Encodes vector data and associates it with the specified key in
     the coder’s archive.
     
     - encodeDirectionalEdgeInsets:forKey:
     Encodes directional edge inset data and associates it with the
     specified key in the coder’s archive.
     
     - encodeUIEdgeInsets:forKey:
     Encodes edge inset data and associates it with the specified key
     in the coder’s archive.
     
     - encodeUIOffset:forKey:
     Encodes offset data and associates it with the specified key in the coder’s archive.
     */
    
    /**
     Encoding Core Media Time Structures

     - encodeCMTime:forKey:
     Encodes a given Core Media time structure and associates it
     with a specified key.
     
     - encodeCMTimeRange:forKey:
     Encodes a given Core Media time range structure and associates
     it with a specified key.
     
     - encodeCMTimeMapping:forKey:
     Encodes a given Core Media time mapping structure and associates
     it with a specified key.
     */
    
    /**
     Secure Coding

     requiresSecureCoding
     Indicates whether the archiver requires all archived classes to
     resist object substitution attacks.
     
     allowedClasses
     The set of coded classes allowed for secure coding.
     */
    
    
    /**
     Decoding Top-Level Objects

     - decodeTopLevelObjectOfClass:forKey:error:
     Decode an object as an expected type, failing if the archived
     type does not match.
     
     - decodeTopLevelObjectOfClasses:forKey:error:
     Decode an object as one of several expected types, failing if
     the archived type does not match.
     
     - decodeTopLevelObjectAndReturnError:
     Decodes a previously-encoded object, populating an error if decoding fails.
     
     - decodeTopLevelObjectForKey:error:
     Decodes the previously-encoded object associated by a key,
     populating an error if decoding fails.
     */
    
    
    /**
     Decoding General Data

     - decodeArrayOfObjCType:count:at:
     Decodes an array of count items, whose Objective-C type is
     given by itemType.
     
     - decodeBoolForKey:
     Decodes and returns a boolean value that was previously encoded
     with encodeBool:forKey: and associated with the string key.
     
     - decodeBytesForKey:returnedLength:
     Decodes a buffer of data that was previously encoded with
     encodeBytes:length:forKey: and associated with the string key.
     
     - decodeBytesWithReturnedLength:
     Decodes a buffer of data whose types are unspecified.
     
     - decodeDataObject
     Decodes and returns an NSData object that was previously
     encoded with encodeDataObject:. Subclasses must override this
     method.
     
     - decodeDoubleForKey:
     Decodes and returns a double value that was previously encoded
     with either encodeFloat:forKey: or encodeDouble:forKey: and
     associated with the string key.
     
     - decodeFloatForKey:
     Decodes and returns a float value that was previously encoded
     with encodeFloat:forKey: or encodeDouble:forKey: and associated
     with the string key.
     
     - decodeIntForKey:
     Decodes and returns an int value that was previously encoded
     with encodeInt:forKey:, encodeInteger:forKey:, encodeInt32:forKey:,
     or encodeInt64:forKey: and associated with the string key.
     
     - decodeIntegerForKey:
     Decodes and returns an NSInteger value that was previously
     encoded with encodeInt:forKey:, encodeInteger:forKey:,
     encodeInt32:forKey:, or encodeInt64:forKey: and associated
     with the string key.
     
     - decodeInt32ForKey:
     Decodes and returns a 32-bit integer value that was previously
     encoded with encodeInt:forKey:, encodeInteger:forKey:,
     encodeInt32:forKey:, or encodeInt64:forKey: and associated
     with the string key.
     
     - decodeInt64ForKey:
     Decodes and returns a 64-bit integer value that was previously
     encoded with encodeInt:forKey:, encodeInteger:forKey:,
     encodeInt32:forKey:, or encodeInt64:forKey: and associated
     with the string key.
     
     - decodeObject
     Decodes and returns an object that was previously encoded with
     any of the encode…Object methods.
     
     - decodeObjectForKey:
     Decodes and returns a previously-encoded object that was
     previously encoded with encodeObject:forKey: or
     encodeConditionalObject:forKey: and associated with the string key.
     
     - decodePoint
     Decodes and returns an NSPoint structure that was previously
     encoded with encodePoint:.
     
     - decodePointForKey:
     Decodes and returns an NSPoint structure that was previously
     encoded with encodePoint:forKey:.
     
     - decodePropertyList
     Decodes a property list that was previously encoded with
     encodePropertyList:.
     
     - decodeRect
     Decodes and returns an NSRect structure that was previously
     encoded with encodeRect:.
     
     - decodeRectForKey:
     Decodes and returns an NSRect structure that was previously
     encoded with encodeRect:forKey:.
     
     - decodeSize
     Decodes and returns an NSSize structure that was previously
     encoded with encodeSize:.
     
     - decodeSizeForKey:
     Decodes and returns an NSSize structure that was previously
     encoded with encodeSize:forKey:.

     - decodeValueOfObjCType:at:size:
     Decodes a single value of a known type from the specified data buffer.
     
     - decodeValuesOfObjCTypes:
     Decodes a series of potentially different Objective-C types.
     
     - decodeObjectOfClass:forKey:
     Decodes an object for the key, restricted to the specified class.
     
     - decodeObjectOfClasses:forKey:
     Decodes an object for the key, restricted to the specified classes.
     
     - decodePropertyListForKey:
     Returns a decoded property list for the specified key.
     */
    
    /**
     Decoding Geometry-Based Data

     - decodeCGAffineTransformForKey:
     Decodes and returns the Core Graphics affine transform structure
     associated with the specified key in the coder’s archive.
     
     - decodeCGPointForKey:
     Decodes and returns the Core Graphics point structure associated
     with the specified key in the coder’s archive.
     
     - decodeCGRectForKey:
     Decodes and returns the Core Graphics rectangle structure associated
     with the specified key in the coder’s archive.
     
     - decodeCGSizeForKey:
     Decodes and returns the Core Graphics size structure associated with
     the specified key in the coder’s archive.
     
     - decodeCGVectorForKey:
     Decodes and returns the Core Graphics vector data associated with
     the specified key in the coder’s archive.
     
     - decodeDirectionalEdgeInsetsForKey:
     Decodes and returns the UIKit directional edge insets structure
     associated with the specified key in the coder’s archive.
     
     - decodeUIEdgeInsetsForKey:
     Decodes and returns the UIKit edge insets structure associated with
     the specified key in the coder’s archive.
     
     - decodeUIOffsetForKey:
     Decodes and returns the UIKit offset structure associated with the
     specified key in the coder’s archive.
     */
    
    
    /**
     Decoding Core Media Time Structures

     - decodeCMTimeForKey:
     Returns the Core Media time structure associated with a given key.
     
     - decodeCMTimeRangeForKey:
     Returns the Core Media time range structure associated with a given key.
     
     - decodeCMTimeMappingForKey:
     Returns the Core Media time mapping structure associated with a given key.
     */
    
    
    /**
     Representing Geometric Types as Strings
     
     CGAffineTransformFromString
     Returns a Core Graphics affine transform structure corresponding
     to the data in a given string.
     
     CGPointFromString
     Returns a Core Graphics point structure corresponding to the
     data in a given string.
     
     CGRectFromString
     Returns a Core Graphics rectangle structure corresponding to
     the data in a given string.
     
     CGSizeFromString
     Returns a Core Graphics size structure corresponding to the
     data in a given string.
     
     CGVectorFromString
     Returns a Core Graphics vector corresponding to the data in
     a given string.
     
     NSDirectionalEdgeInsetsFromString
     Returns a directional edge insets structure based on data in
     the specified string.
     
     UIEdgeInsetsFromString
     Returns a UIKit edge insets structure based on the data in
     the specified string.
     
     UIOffsetFromString
     Returns a UIKit offset structure corresponding to the data
     in a given string.
     
     NSStringFromCGRect
     Returns a string formatted to contain the data from a rectangle.
     
     NSStringFromCGVector
     Returns a string formatted to contain the data from a vector
     data structure.
     
     NSStringFromCGAffineTransform
     Returns a string formatted to contain the data from an affine transform.
     
     NSStringFromCGPoint
     Returns a string formatted to contain the data from a point.
     
     NSStringFromCGSize
     Returns a string formatted to contain the data from a size data structure.
     
     NSStringFromDirectionalEdgeInsets
     Returns a string formatted to contain the data from a directional edge insets structure.
     
     NSStringFromUIEdgeInsets
     Returns a string formatted to contain the data from an edge insets structure.
     
     NSStringFromUIOffset
     Returns a string formatted to contain the data from an offset structure.
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
