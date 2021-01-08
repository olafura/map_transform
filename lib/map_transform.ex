defmodule MapTransform do
  def transform(source, mapping) do
    base_map = base_map_from_mapping(mapping)

    mapping
    |> Enum.reduce(base_map, &do_transform(&1, &2, source))
  end

  def do_transform({from_path, to_path}, acc, source) do
    do_transform({from_path, to_path, & &1}, acc, source)
  end

  def do_transform({from_path, to_path, function}, acc, source) do
    put_in(acc, to_path, source |> get_in(from_path) |> function.())
  end

  defp base_map_from_mapping(mapping) do
    mapping
    |> Enum.map(&elem(&1, 1))
    |> base_map()
  end

  defp base_map(paths) do
    paths
    |> Enum.reduce(%{}, &do_base_map/2)
  end

  def do_base_map([], _acc) do
    nil
  end

  def do_base_map([last], acc) do
    Map.put(acc, last, nil)
  end

  def do_base_map([key | rest], acc) do
    Map.put(acc, key, do_base_map(rest, %{}))
  end
end
