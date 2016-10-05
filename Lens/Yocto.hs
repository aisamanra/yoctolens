{-# LANGUAGE RankNTypes #-}

module Lens.Yocto ( Lens, lens ) where

-- | This is the type alias for a @Lens@ in other @lens@
--   packages. It is compatible with any other package that can
--   use the same family of lenses, including @microlens@ or
--   @lens-family-core@.
type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t

-- | This is a function to build a 'Lens' from a getter and a setter.
lens :: (s -> a) -> (b -> s -> t) -> Lens s t a b
lens get set f a = (`set` a) `fmap` f (get a)
