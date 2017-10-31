{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_HaskellExercises (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\krist\\documents\\github\\HaskellExercises\\.stack-work\\install\\34070b1b\\bin"
libdir     = "C:\\Users\\krist\\documents\\github\\HaskellExercises\\.stack-work\\install\\34070b1b\\lib\\x86_64-windows-ghc-8.0.2\\HaskellExercises-0.1.0.0"
dynlibdir  = "C:\\Users\\krist\\documents\\github\\HaskellExercises\\.stack-work\\install\\34070b1b\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\krist\\documents\\github\\HaskellExercises\\.stack-work\\install\\34070b1b\\share\\x86_64-windows-ghc-8.0.2\\HaskellExercises-0.1.0.0"
libexecdir = "C:\\Users\\krist\\documents\\github\\HaskellExercises\\.stack-work\\install\\34070b1b\\libexec"
sysconfdir = "C:\\Users\\krist\\documents\\github\\HaskellExercises\\.stack-work\\install\\34070b1b\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HaskellExercises_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HaskellExercises_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "HaskellExercises_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "HaskellExercises_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HaskellExercises_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HaskellExercises_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
