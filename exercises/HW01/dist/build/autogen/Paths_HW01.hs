module Paths_HW01 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/harrylaou/Library/Haskell/bin"
libdir     = "/Users/harrylaou/Library/Haskell/ghc-7.10.2-x86_64/lib/HW01-0.1.0.0"
datadir    = "/Users/harrylaou/Library/Haskell/share/ghc-7.10.2-x86_64/HW01-0.1.0.0"
libexecdir = "/Users/harrylaou/Library/Haskell/libexec"
sysconfdir = "/Users/harrylaou/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HW01_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HW01_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "HW01_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HW01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HW01_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
