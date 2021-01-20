
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





Known issues
------------

* Needs more/better tests and docs.




&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
LGPL-2.1-or-later
<!--/#echo -->
