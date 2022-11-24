  {
      inputs =
        {
          flake-utils.url = "github:numtide/flake-utils" ;
	  argue.url = "github:nextmoose/argue" ;
	  try.url = "github:nextmoose/try" ;
        } ;
      outputs =
        { self , flake-utils , argue , try } :
          flake-utils.lib.eachDefaultSystem
          (
            system :
              {
	        lib = builtins.mapAttrs ( name : value : builtins.getAttr system ( builtins.getAttr "lib" value ) ) { argue = argue ; try = try ; } ;
              }
      ) ;
    }
