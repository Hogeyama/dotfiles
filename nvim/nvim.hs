{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Neovim

import qualified Neovim.GhcModNvim   as GhcModNvim
import qualified Neovim.Ghcid.Simple as GhcidSimple
import qualified Neovim.LSP          as LSP
import           Sample

main :: IO ()
main =
  neovim defaultConfig { plugins =
    plugins defaultConfig ++
    [ samplePlugin
    , GhcidSimple.plugin
    , GhcModNvim.plugin
    , LSP.plugin
    ]
  }

samplePlugin :: Neovim (StartupConfig NeovimConfig) NeovimPlugin
samplePlugin = wrapPlugin Plugin
  { environment = ()
  , exports =
        [ $(command' 'echoCurrentSyntax) []
        , $(function' 'sampleFunction) Sync
        ]
  }
{-

import qualified Neovim.GhcModNvim   as GhcModNvim
import qualified Neovim.Ghcid.Simple as GhcidSimple
import qualified Neovim.LSP          as LSP
import           Sample

main :: IO ()
main =
  neovim defaultConfig { plugins =
    plugins defaultConfig ++
    [ GhcModNvim.plugin
    , GhcidSimple.plugin
    , LSP.plugin
    , samplePlugin
    ]
  }

samplePlugin :: Neovim (StartupConfig NeovimConfig) () NeovimPlugin
samplePlugin = wrapPlugin Plugin
  { exports = []
  , statefulExports =
    [ StatefulFunctionality
      { readOnly = ()
      , writable = ()
      , functionalities =
        [ $(command' 'echoCurrentSyntax) []
        , $(function' 'sampleFunction) Sync
        , $(function' 'functionDie) Sync
        , $(command' 'commandDie) []
        ]
      }
    ]
  }

-}
