{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Control.Monad.Ether.Implicit.State
    ( StateT
    , State
    , runStateT
    , runState
    , evalStateT
    , evalState
    , execStateT
    , execState
    --
    , MonadState
    , get
    , gets
    , put
    , state
    , modify
    ) where

import Data.Proxy
import qualified Control.Monad.Ether.State as Explicit

type StateT s = Explicit.StateT s s
type State  s = Explicit.State  s s

runStateT :: StateT s m a -> s -> m (a, s)
runStateT = Explicit.runStateT Proxy

runState :: State s a -> s -> (a, s)
runState = Explicit.runState Proxy

evalStateT :: Functor m => StateT s m a -> s -> m a
evalStateT = Explicit.evalStateT Proxy

evalState :: State s a -> s -> a
evalState = Explicit.evalState Proxy

execStateT :: Functor m => StateT s m a -> s -> m s
execStateT = Explicit.execStateT Proxy

execState :: State s a -> s -> s
execState = Explicit.execState Proxy

type MonadState s = Explicit.MonadState s s

get :: forall m s . MonadState s m => m s
get = Explicit.get (Proxy :: Proxy s)

gets :: forall m s a . MonadState s m => (s -> a) -> m a
gets = Explicit.gets (Proxy :: Proxy s)

put :: forall m s . MonadState s m => s -> m ()
put = Explicit.put (Proxy :: Proxy s)

state :: forall m s a . MonadState s m => (s -> (a, s)) -> m a
state = Explicit.state (Proxy :: Proxy s)

modify :: forall m s . MonadState s m => (s -> s) -> m ()
modify = Explicit.modify (Proxy :: Proxy s)

