
module Sample where

import Neovim

type Neovim' a = Neovim () a

echoCurrentSyntax :: CommandArguments -> Neovim' ()
echoCurrentSyntax _ = do
    b  <- vim_get_current_buffer'
    ft <- nvim_buf_get_var b "current_syntax"
    _  <- vim_out_write $ show ft ++ "\n"
    return ()

sampleFunction :: String -> Neovim' Int
sampleFunction s = do
  return $ length s

commandDie :: CommandArguments -> Neovim' ()
commandDie = undefined

functionDie :: String -> Neovim' Int
functionDie = undefined

