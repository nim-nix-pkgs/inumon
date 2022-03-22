{
  description = ''A high-level image I/O library for Nim '';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-inumon-master.flake = false;
  inputs.src-inumon-master.owner = "dizzyliam";
  inputs.src-inumon-master.ref   = "master";
  inputs.src-inumon-master.repo  = "inumon";
  inputs.src-inumon-master.type  = "github";
  
  inputs."nimterop".owner = "nim-nix-pkgs";
  inputs."nimterop".ref   = "master";
  inputs."nimterop".repo  = "nimterop";
  inputs."nimterop".dir   = "v0_6_13";
  inputs."nimterop".type  = "github";
  inputs."nimterop".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimterop".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."arraymancer".owner = "nim-nix-pkgs";
  inputs."arraymancer".ref   = "master";
  inputs."arraymancer".repo  = "arraymancer";
  inputs."arraymancer".dir   = "v0_7_11";
  inputs."arraymancer".type  = "github";
  inputs."arraymancer".inputs.nixpkgs.follows = "nixpkgs";
  inputs."arraymancer".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nigui".owner = "nim-nix-pkgs";
  inputs."nigui".ref   = "master";
  inputs."nigui".repo  = "nigui";
  inputs."nigui".dir   = "v0_2_5";
  inputs."nigui".type  = "github";
  inputs."nigui".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nigui".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-inumon-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-inumon-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}