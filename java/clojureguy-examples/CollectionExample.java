/* 
example comparing java to clojure blog post:
https://blog.klipse.tech/clojure/2019/05/10/java-is-confusing-clojure-is-simple.html

usage:
javac -Xlint:unchecked /Users/merlinr/repo/sde-path/java/CollectionExample.java
java CollectionsExample

myNumbers: [1, 2, 3, 4]
yourNumbers: [1, 2, 3, 4]
theirNumbers: [1, 2, 3, 5]


comments:
this is what I expected via pass-by-reference, primitives vs. objects
*/

import java.util.*;
public class CollectionExample
{
  public static void main(String[] args)
  {
    ArrayList myNumbers = new ArrayList<Integer>(Arrays.asList(1,2,3));
    ArrayList yourNumbers = myNumbers;
    yourNumbers.add(4);
        
    ArrayList theirNumbers = new ArrayList<Integer>(Arrays.asList(1,2,3));
    add5(theirNumbers);

    System.out.println("myNumbers: " + myNumbers);
    System.out.println("yourNumbers: " + yourNumbers);
    System.out.println("theirNumbers: " + theirNumbers);
  }

  public static void add5(ArrayList a) {
    a.add(5);
  }
}
