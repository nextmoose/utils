  {
      inputs =
        {
          flake-utils.url = "github:numtide/flake-utils" ;
	  argue.url = "github:nextmoose/argue" ;
        } ;
      outputs =
        { self , flake-utils , argue } :
          flake-utils.lib.eachDefaultSystem
          (
            system :
              {
	        lib = builtins.mapAttrs ( name : value : builtins.getAttr system ( builtins.getAttr "lib" value ) ) { argue = argue ; } ;
              }
      ) ;
    }
