  {
      inputs =
        {
	  argue.url = "github:nextmoose/argue" ;
          flake-utils.url = "github:numtide/flake-utils" ;
	  strip.url = "github:nextmoose/strip" ;
	  try.url = "github:nextmoose/try" ;
	  visit.url = "github:nextmoose/visit" ;
        } ;
      outputs =
        { argue , flake-utils , self , try , visit } :
          flake-utils.lib.eachDefaultSystem
          (
            system :
              {
	        lib = builtins.mapAttrs ( name : value : builtins.getAttr system ( builtins.getAttr "lib" value ) ) { argue = argue ; strip = strip ; try = try ; visit = visit ; } ;
              }
      ) ;
    }
