//
//  StackHeap.m
//  Runtime
//
//  Created by tigerfly on 2020/11/19.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "StackHeap.h"

@interface StackHeap ()

@end

@implementation StackHeap

//http://c.biancheng.net/c/stack/
//https://www.learncpp.com/cpp-tutorial/79-the-stack-and-the-heap/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark --
    /*
     Stack VS Heap
     
     So far we have seen how to declare basic type variables such as
     int, double, etc, and complex types such as arrays and structs.
     The way we have been declaring them so far, with a syntax that
     is like other languages such as MATLAB, Python, etc, puts these
     variables on the stack in C.
     */
    
    
    /**
     The Stack
     
     What is the stack? It's a special region of your computer's memory
     that stores temporary variables created by each function ( including
     the main() function). The stack is a "LIFO"(last in, first out) data
     structure, that is managed an optimized by the CPU quite closely.
     Every time a function declares a new variable, it is "pushed" onto
     the stack. Then every time a function exists, all of the variables
     pushed onto the stack by that function, are freed (that is to say,
     they are deleted). Once a stack variable is freed, that region of
     memory becomes available for other stack variables.
     
     The advantage of using the stack to store variables, is that memory
     is managed for you. You don't have to allocate memory by hand, or
     free it once you don't need it any more. What's more, because the
     CPU organizes stack memory so efficiently, reading from and writing
     to stack variables is very fast.
     
     A key to understanding the stack is the notion that when a function
     exits, all of its variables are popped off of the stack (and hence
     lost forever). Thus stack variables are local in nature. This is
     related to a concept we saw earlier known as variable scope, or
     local vs global variables. A common bug in C programming is attempting
     to access a variable that was created on the stack inside some
     function, from a place in your program outside of that function
     (i.e. after that function has exited).
     
     Another feature of the stack to keep in mind, is that there is a
     limit (varies with OS) on the size of variables that can be
     stored on the stack. This is not the case for variables allocated
     on the heap.
     
     To summarize the stack:
     •  the stack grows and shrinks as functions push and pop local
     variables
     •  there is no need to manage the memory yourself, variables are
     allocated and freed automatically
     •  the stack has size limits
     •  stack variables only exist while the function that created
     them, is running
     */
    
    
    /**
     The Heap
     
     The heap is a region of your computer's memory that is not
     managed automatically for you, and is not as tightly managed
     by the CPU. It is a more free-floating region of memory
     (and is larger). To allocate memory on the heap, you must
     use malloc() or calloc(), which are built-in C functions.
     Once you have allocated memory on the heap, you are responsible
     for using free() to deallocate that memory once you don't
     need it any more. If you fail to do this, your program will
     have what is known as a memory leak. That is, memory on the
     heap will still be set aside (and won't be available to
     other processes). As we will see in the debugging section,
     there is a tool called valgrind that can help you detect
     memory leaks.
     
     Unlike the stack, the heap does not have size restrictions
     on variable size (apart from the obvious physical limitations
     of your computer). Heap memory is slightly slower to be
     read from and written to, because one has to use pointers
     to access memory on the heap. We will talk about pointers
     shortly.
     
     Unlike the stack, variables created on the heap are
     accessible by any function, anywhere in your program. Heap
     variables are essentially global in scope.
     */
    
    /**
     Stack vs Heap Pros and Cons
     
     Stack
     •  very fast access
     •  don't have to explicitly de-allocate variables
     •  space is managed efficiently by CPU, memory will not become fragmented
     •  local variables only
     •  limit on stack size (OS-dependent)
     •  variables cannot be resized
     
     Heap
     •  variables can be accessd globally
     •  no limit on memory size
     •  (relatively slower access)
     •  no guaranteed efficient use of space, memory may become fragmented over
        time as blocks of memory are allocated, then freed
     •  you must manage memory (you're in charge of allocating and freeing
        variables)
     •  variables can be resized using realloc()
     
     */
    
    /**
     When to use the heap?
     
     when should you use the heap, and when should you use the stack?
     If you need to allocate a large block of memory (e.g. a large array,
     or a big struct), and you need to keep that variable around a long
     time (like a global), then you should allocate it on the heap. If
     you are dealing with relatively small variables that only need to
     persist as long as the function using them is alive, then you should
     use the stack, it's easier and faster. If you need variables like
     arrays and structs that can change size dynamically (e.g. arrays that
     can grow or shrink as needed) then you will likely need to allocate
     them on the heap, and use dynamic memory allocation functions like
     malloc(), calloc(), realloc() and free() to manage that memory
     "by hand". We will talk about dynamically allocated data structures
     after we talk about pointers.
     
     */
    
    
#pragma mark -- Stack vc Heap
    
    /**
     What is a Stack?
     
     A stack is a special area of computer's memory which stores
     temporary variables created by a function. In stack, variables
     are declared, stored and initialized during runtime.
     
     It is a temporary storage memory. When the computing task is
     complete, the memory of the variable will be automatically
     erased. The stack section mostly contains methods, local
     variable, and reference variables.
     */
    
    /**
     What is Heap?
     
     The heap is a memory used by programming languages to store
     global variables. By default, all global variable are stored
     in heap memory space. It supports Dynamic memory allocation.
     
     The heap is not managed automatically for you and is not as
     tightly managed by the CPU. It is more like a free-floating
     region of memory.
     */
    
    /**
     Key Difference
     
     •  Stack is a linear data structure whereas Heap is a hierarchical
     data structure.
     •  Stack memory will never become fragmented whereas Heap memory
     can become fragmented as blocks of memory are first allocated
     and then freed.
     •  Stack accesses local variables only while Heap allows you to
     access variables globally.
     •  Stack variables can't be resized whereas Heap variables can
     be resized.
     •  Stack memory is allocated in a contiguous block whereas Heap
     memory is allocatedd in any random order.
     •  Stack doesn't require to de-allocate variables whereas in Heap
     de-allocation is needed.
     •  Stack allocation and deallocation are done by compiler instructions
     whereas Heap allocation and deallocation is done by the programmer.
     */
    
    /**
     Key differents between Stack and Heap
     
     Parameter              Stack                    Heap
     -------------------------------------------------------------------
     Type of data           A stack is a liner          Heap is a hierarchical data
     strcutures             data structure              structure.
     -------------------------------------------------------------------
     Access speed           High-speed access           Slower compared to stack
     -------------------------------------------------------------------
     Space management       Space manage efficiently    Heap Space not used as efficiently
     by OS so memory will never  Memory can become fragmented as blocks
     become fragmented.          of memory first allocated and then
     freed.
     -------------------------------------------------------------------
     Access                 Local variables only        it allows you to access variables
     globally.
     -------------------------------------------------------------------
     Limit of space         Limit on stack size         Does not have a specific limit
     size                   dependent on OS.            on memory size.
     -------------------------------------------------------------------
     Resize                 Variables cannot be         Variable can be resized.
     resized
     -------------------------------------------------------------------
     Memory                 Memory is allocated in      Memory is allocated in any
     Allocation             a contiguous block.         random order.
     -------------------------------------------------------------------
     Allcation and          Automatically done by       It is manually done by the
     Deallocation           coompiler instructions.     programmer.
     -------------------------------------------------------------------
     Deallocation           Does not require to de-     Explicit de-allocation is
     allocate variables.         needed.
     -------------------------------------------------------------------
     Cost                   Less                        More
     -------------------------------------------------------------------
     Implementation         A stack can be implemented  Heap can be implemented
     in 3 ways simple array      using array and        trees.
     based,using dynamic memory,
     and linked list based.
     -------------------------------------------------------------------
     Main issue             Shortage of memory          Memory fragmentation
     -------------------------------------------------------------------
     Locality of            Automatic compile time      Adequate
     reference              instructions.
     -------------------------------------------------------------------
     Flexibility            Fixed size                  Resizing is possible
     -------------------------------------------------------------------
     Access time            Faster                      Slower
     -------------------------------------------------------------------
     */
    
    /**
     Advantage of using Stack
     
     Here, are the pros/benefits of using stack:
     •  Helps you to manage the data in a Last in First out(LIFO) method
     which is not possible with linked list and array.
     •  When a funtion is called the local variables are stored in a
     stack, and it is automatically destroyed once returned.
     •  A stack is used when a variable is not used outside that function.
     •  It allows you to control how memory is allcated and deallocated.
     •  Stack automatically cleans up the object.
     •  Not easily corrupted
     •  Variables cannot be resized.
     */
    
    /**
     Advantages of using Heap
     
     Pros/benefit of using heap memory are:
     •  Heap helps you to find the greatest and minimum number
     •  Garbage collection runs on the heap memory to free the
     memory used by the object.
     •  Heap method also used in the Priority Queue.
     •  It allows you to access variables globally.
     •  Heap doesn't have any limit on memory size.
     */
    
    /**
     Disadvantages of using Stack
     
     Cons/Drawbacks of using Stack memory are:
     •  Stack memory is very limited.
     •  Creating too mmany objects on the stack can increase the
     risk of stack overflow.
     •  Random access is not possible.
     •  Varaible Storage will be overwritten, which sometimes leads
     to undefined behavior of the function or program.
     •  The Stack will fall outside of the memory area, which might
     lead to an abnormal termination.
     */
    
    /**
     Disadvantages of using Heap
     
     Cons/drawbacks of using Heaps memory are:
     •  it can provide the maximum memory an OS can provide
     •  it takes more time to compute
     •  Memory management is more complicated in heap memory
     as it is used globally.
     •  It takes too much time in execution compared to the
     stack.
     */
    
    /**
     When to use the heap or Stack?
     
     You should use heap when you require to allocate a large
     block of memory. For example, you want to create a large
     size array or big structure to keep that variable around
     a long time then you should allocate it on the heap.
     
     However, if you are working with relatively small variables
     that are only require until the function using them is alive.
     Then you need to use the stack, which is faster and easier.
     */
    
    
#pragma mark -- Memory Management
    
    /**
     Memory Allocation
     
     "To allocate" means to assign, allot, distribute, or "set apart
     for a particular purpose." Programs manages their memory by
     partitioning or dividing it into different units that perform
     specific tasks. Two of those units are the stack and the heap,
     which manage the program's unused memory and allocate it for
     different kinds of data or variables. When the memory is no longer
     needed, it may be deallocated. Deallocated memory is returned
     to its original source, either the stack or the heap, and is
     available to be reused for different data.
     
     When an operating system (OS) runs a program, it must first load
     the program into main memory. Memory is used both for the program's
     machine instructions and for the data that the program uses.
     At the time that figure 1 was created, computers typically used a
     memory allocation technique called segmented memory. When the OS
     loads a program on a segmented-memory computer, it allocates to
     the program a contiguous block or segment of memory and the program
     can use no more memory than this. As the program's memory was limited,
     it was necessary to divide it into regions that performed specific
     functions within the program. Although this memory management
     technique is now obsolete, programs continue to organize their
     memory based on the functional units illustrate here.
     
     Contemporary systems are based on a more flexible memory allocation
     technique called paged memory. These systems manage memory dynamically;
     that is, the amount of memory allocate to a program is allowed to
     increase an decrease as the program's needs change. Memory is allocated
     to the progarm and reclaimed by the OS in fixed-size chunks called
     pages. When the OS loads a program on a paged-memory computer, it
     initially allocates a minimal number of pages to the program, but
     the OS will supply additional memory as it is needed, and that
     memory is added to either the heap, the stack, or the mechine
     instructions area. Any machine code or data that are not immediately
     needed are not initally loaded, and pages of memory containing
     machine instructions or data that have not been used recently may
     be returned to the OS to be reallocated to other programs that
     currently need more memory. Although Figure 1 no longer represents
     the physical layout of memory, it accurately represents the
     functional or logical organization of program memory.
     
     file:///Users/tigerfly/Desktop/Runtime/Runtime/layout.png
     
     1. The text area contains the program's machine instuctions.
     2. Global variables are defined in global scope outside of any
        function or object; static variables have the keyword static
        includee as part of their definition. The memory that holds
        global and static variables is typically allocated at program
        startup.
     3. The space illustrated here was actually allocated but unused
        on a segmented-memory system, and provided space in to which
        the stack and heap could grow. On a paged-memory system this
        space is not actually allocated but signifies that there is
        space available for stack and heap growth.
     4. The stack (sometimes called the runtime stack) contains all
        of the automatic variables.
     5. Memory is allocated from and returned to the heap with the new
        and delete operators respectively.
     */
    
    /**
     It's easy to get confused by the term "allocate" when we talk
     about a C++ program in the context of hardware and the operating
     system. The operating system, which is tasked with managing
     all of a computer's resources -- including main memory - allocates
     physical memory to a running program in pages, but this operation
     is completely transport to and beyoud the control of programmers.
     
     On the other hand, programmers can request additional memory for
     program data. The OS provides a host environment in which a
     program runs. One of the services that the OS provides, in the
     form of runtime code that is linked with our C++ code, is the
     memory managers that implement the stack and the heap. When a
     programmer requests additional memory, that memory is allocated
     either from teh stack(by defining an automatic variable) or from
     the heap (using teh "new" operator).
     
     For our discussions, memory allocated to a running program comes
     from either the stack or the heap, and deallocated memory is
     returned to the structure from which it was originally allocated.
     */
    
    /**
     The important concept that we can draw from Figure 1 is that
     a running program maintains its data in one of three logical
     regions of memory. The memory for global and static variables
     is allocated when the program is first loaded in memory for
     execution and is not deallocated until the progarm terminates.
     Values stored in these variables do not change unless the
     programmer explicitly changes them (barring changes made by
     external - outside of the program - systems). The other two
     regions, the stack and the heap, are more dynamic - the memory
     is allocated to the program and deallocated as needed. The
     differences between these two regions are the algorithms that
     manage the memory and therefore how they behave.
     */
    
    
    /**
     Stack
     
     A stack is a simple last-in, first-out(LIFO) data structure
     that is often presented to new computer scientists as a
     stack of plates in a cafeteria. In the cafeteria example,
     plates are removed from or added to the stack only at the
     top. One of our first actions upon entering the cafeteria
     is to pop a plate off the top of the stack of plates before
     we go through the line. Similaryly, the dishwashers push
     each clean plate on top of the stack one at a time. In this
     way, the last clean plate pushed on the stack is the first
     plate that a customer pops off of the top. Inserting or
     removing a plate from the middle of teh stack is not permitted.
     Stacks must support at least two operations: push and pop;
     other operations are possible but are not required.
     */
    
    /**
     Heap
     
     In contrast to the stack, the heap is much more flexible:
     access is not restricted to a single location within the
     heap. The memory managed by the heap may be allocated to
     the program from anyplace in the heap, even if that memory
     is in the middle of the heap. How is it possible to have
     a "hole" in the middle of the heap? The program can return
     memory to the heap whenever it is convenient to do so. So,
     unlike a stack, which is required to deallocate memory in
     the reverse order in which it was allocated ,the program
     may return memory to the heap without regard to the original
     order of allocation. The easiest way to see the difference
     between the stack and the heap behaviors is to compare Figure2
     with Figure3.
     
     There is only one restriction on the memory that is allocated
     to the program from the heap: it must form a contiguous block
     large enough to satisfy the request with a single chunk of
     memory. This one restriction increases the complexity of a heap
     until it finds a contiguous block of memory that is large
     enough to satisfy the request. Second, When memory is returned
     to the stack, adjacent freed blocks must be coalesced to
     better accommodate future requests for large blocks of memory.
     The heap's increased complexity means that managing memory
     with a heap is slower and less efficient than doing so with
     a stack. But a heap also has advantages that justify the
     increased overhead. The next section explores some of those
     advantages and illustrates how the stack and the heap work
     together to manage complex data in a running program.
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
