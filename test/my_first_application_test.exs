defmodule MyFirstApplicationTest do
  use ExUnit.Case
  doctest MyFirstApplication

  test "greets the world" do
    assert MyFirstApplication.hello() == :world
  end
end
