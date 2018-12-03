{:ok, contents} = File.read "input.txt"
IO.puts String.split(contents, "\n", trim: true)
  |> Enum.map(&String.to_integer/1)
  |> Enum.sum
