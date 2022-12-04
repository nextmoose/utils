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
	        lib =
		  let
		    _bash-variable = expression : _utils.bash-variable ( if builtins.typeOf expression == "string" then expression else builtins.concatStringsSep "_" expression ) ;
		    in builtins.mapAttrs ( name : value : builtins.getAttr system ( builtins.getAttr "lib" value ) ) { argue = argue ; bash-variable = _bash-variable ; strip = strip ; try = try ; visit = visit ; } ;
              }
      ) ;
    }
