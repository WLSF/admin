defprotocol Validations do
  @fallback_to_any true
  def changeset(object, attrs)
end

defimpl Validations, for: Any do
  def changeset(_object, _attrs), do: {:error, "this Schema doesnt implement Validations protocol."}
end
