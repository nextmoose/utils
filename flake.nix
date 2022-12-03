  {
      inputs =
        {
	  argue.url = "github:nextmoose/argue" ;
	  bash-variable = "github:nextmoose/bash-variable" ;
          flake-utils.url = "github:numtide/flake-utils" ;
	  strip.url = "github:nextmoose/strip" ;
	  try.url = "github:nextmoose/try" ;
	  visit.url = "github:nextmoose/visit" ;
        } ;
      outputs =
        { _argue , _bash-variable , _strip , _try , _visit , flake-utils , self } :
          flake-utils.lib.eachDefaultSystem
          (
            system :
              {
	        lib = builtins.mapAttrs ( name : value : builtins.getAttr system ( builtins.getAttr "lib" value ) ) { argue = _argue ; bash-variable = _bash-variable ; strip = _strip ; try = _try ; visit = _visit ; } ;
              }
      ) ;
    }
