
<!--#echo json="package.json" key="name" underline="=" -->
learn_ldpreload
===============
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
My research notes while learning to LD_PRELOAD.
<!--/#echo -->


Experiments
-----------

* 210120-1630: Trying to overload a simple hello world program's main()
  to print its arguments.
  * main() is special and can't be overloaded.
* 210120-1635: Let main() delegate to hello().
  * no effect.
* 210120-1750: Can I overload library functions?
  * Works for fopen, but not for strlen and hello.
  * strlen might be another special case because it's in stdlib,
    maybe the compiler optimized it in some magic way.
  * The hello function cannot be redirected becase it isn't dynamically
    loaded in the first place. No dynamic lookup is required, because
    it's in the same "library" as main().





Known issues
------------

* Needs more/better tests and docs.




&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
LGPL-2.1-or-later
<!--/#echo -->
