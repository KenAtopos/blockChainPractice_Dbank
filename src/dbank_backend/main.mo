import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  let id = 747464646;
  stable var startTime = Time.now();
  // startTime := Time.now();

  // Debug.print(debug_show(startTime));

  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {

    let tempValue : Float = currentValue - amount;

    if ( tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("There is an issue.")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapseNS = currentTime - startTime;
    let timeElapseS = timeElapseNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseS));
    startTime := currentTime;
    Debug.print(debug_show(currentValue));
  }
  // topUp();
}
