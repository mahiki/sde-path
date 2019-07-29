/* 
example comparing java to clojure blog post:
https://blog.klipse.tech/clojure/2019/05/10/java-is-confusing-clojure-is-simple.html

usage:
javac -Xlint:unchecked ValueExample.java
java ValueExample

myNumber: 42
yourNumber: 52
theirNumber: 42


comments:
this is what I expected via pass-by-reference, primitives vs. objects
*/

public class ValueExample
{
  public static void main(String[] args)
  {
    int myNumber = 42;
    int yourNumber = myNumber;
    yourNumber = yourNumber + 10;
        
    int theirNumber = 42;
    add5(theirNumber);

    System.out.println("myNumber: " + myNumber);
    System.out.println("yourNumber: " + yourNumber);
    System.out.println("theirNumber: " + theirNumber);
  }

  public static void add5(int a) {
    // int b = a + 5;                   /* this is misleading: creates a new return variable. */
    a += 5;                             /* still a local variable */
  }
}
