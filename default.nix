{ stdenv }:
  stdenv.mkDerivation
    { pname = "z";
      version = "1622481819";
      # ^ there isn't a version, so the UNIX time of commit is used

      src =
        fetchTarball
          { url = "https://github.com/rupa/z/archive/b82ac78a2d4457d2ca09973332638f123f065fd1.tar.gz";
            sha256 = "0phk9lswwxsypchb11qsnxy1pv5xg1zkrqj8im6x2icma63hfcz2";
          };

      phases = [ "unpackPhase" "installPhase" ];

      installPhase =
        ''
        mkdir -p $out/share/man/man1
        cp z.1 $out/share/man/man1
        cp z.sh $out
        # ^ for use in the module
        '';
    }
