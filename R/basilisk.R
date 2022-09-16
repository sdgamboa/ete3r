ETE3Env <- basilisk::BasiliskEnvironment(
    envname = "ETE3Env",
    pkgname = "ete3r",
    channels = c("conda-forge", "etetoolkit")
    packages = c("ete3==3", "ete_toolchain==3")
)
