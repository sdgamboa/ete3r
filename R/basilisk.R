ETE3Env <- basilisk::BasiliskEnvironment(
    envname = "ETE3Env",
    pkgname = "ete3r",
    channels = "etetoolkit",
    packages = c("python==3.6.15", "ete3==3.1.2", "ete_toolchain==3.0.0")
)
