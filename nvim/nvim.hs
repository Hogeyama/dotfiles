{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Neovim

import qualified Neovim.GhcModNvim   as GhcModNvim
import qualified Neovim.Ghcid.Simple as GhcidSimple
import           Sample

main :: IO ()
main =
  neovim defaultConfig { plugins =
    plugins defaultConfig ++
    [ GhcModNvim.plugin
    , GhcidSimple.plugin
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
        ]
      }
    ]
  }

