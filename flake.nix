  {
      inputs =
        {
	  argue.url = "github:nextmoose/argue" ;
          flake-utils.url = "github:numtide/flake-utils" ;
	  try.url = "github:nextmoose/try" ;
	  utils.url = "github:nextmoose/utils" ;
        } ;
      outputs =
        { argue , flake-utils , self , try , visit } :
          flake-utils.lib.eachDefaultSystem
          (
            system :
              {
	        lib = builtins.mapAttrs ( name : value : builtins.getAttr system ( builtins.getAttr "lib" value ) ) { argue = argue ; try = try ; visit = visit ; } ;
              }
      ) ;
    }
