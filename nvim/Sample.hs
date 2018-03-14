
module Sample where

import Neovim

echoCurrentSyntax :: CommandArguments -> Neovim r st ()
echoCurrentSyntax _ = do
    b  <- vim_get_current_buffer'
    ft <- nvim_buf_get_var b "current_syntax"
    _  <- vim_out_write $ show ft ++ "\n"
    return ()

