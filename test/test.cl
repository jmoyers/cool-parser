class Main {
  x : Int;
  y : Int <- 2;

  main() : Int { 
    (let x : Int <- 1 in
      case x of
        a : Int => 1;
        b : String => 2;
        c : Main => 3;
      esac
    )
  };
};
