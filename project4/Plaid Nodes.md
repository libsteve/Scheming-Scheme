Plaid Programing Language
-------------------------

* infulenced by Java
	* runs on JVM
	* has access to Java libraries
* State-oriented object model
	* things natively have state
	* language infulences thought; state-heavy languages promote thinking about state
	* states define when things can be called
	* state permissions
		* unique
		* immutable
		* shared
		* none
* implicit structural subtyping
	* duck typing based first on method names and parameters, then on return types
* state composition
	* can add on methods to other states using 'with' keyword
* dynamic typing with 'dynamic' keyword
* Safe concurrency
	* compiler decides when to implement concurrency for you
	* use of state permissions and typing to dictate how to form concurrency via dataflow graphs
* use of 'split' keyword (on a group?) to concurrently perform methods separated with '||' operator
* Concurrency Groups
	* use of 'group' keyword to create groups that are should concurrent together
	* use of a variable within a group adopts it into the group
	* use of a group's variable outside a group emancipates it from the group
* an attempt to get rid of nulls

Resources
---------

* http://www.cs.cmu.edu/~aldrich/presentations/plaid-resources.pdf
