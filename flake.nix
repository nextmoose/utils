  {
      inputs =
        {
	  argue.url = "github:nextmoose/argue" ;
	  bash-variable.url = "github:nextmoose/bash-variable" ;
          flake-utils.url = "github:numtide/flake-utils" ;
	  strip.url = "github:nextmoose/strip" ;
	  try.url = "github:nextmoose/try" ;
	  visit.url = "github:nextmoose/visit" ;
        } ;
      outputs =
        { argue , bash-variable , flake-utils , self , strip , try , visit } :
          flake-utils.lib.eachDefaultSystem
          (
            system :
              {
	        lib = builtins.mapAttrs ( name : value : builtins.getAttr system ( builtins.getAttr "lib" value ) ) { argue = argue ; bash-variable = bash-variable ; strip = strip ; try = try ; visit = visit ; } ;
              }
      ) ;
    }
