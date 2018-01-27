defmodule Stellar.Transactions do
  @moduledoc """
  Functions for interacting with Transactions
  """
  alias Stellar.Base

  @doc """
  Returns all transactions

  optional `params` can take any of the following.:

  * `cursor`: A paging token, specifying where to start returning records from.

  * `order`: The order in which to return rows, "asc" or "desc".

  * `limit`: Maximum number of records to return.
  """
  @spec all(Keyword.t) :: {Stellar.status, map}
  def all(params \\ []) do
    query = Base.process_query_params(params)
    Base.get("/transactions#{query}")
  end

  @doc """
  Gets transaction details
  """
  @spec get(binary) :: {Stellar.status, map}
  def get(hash) do
    Base.get("/transactions/#{hash}")
  end

  @doc """
  Returns all transactions for given account

  See `all/1` for allowed optional params
  """
  @spec all_for_account(binary, Keyword.t) :: {Stellar.status, map}
  def all_for_account(accountId, params \\ []) do
    query = Base.process_query_params(params)
    Base.get("/accounts/#{accountId}/transactions#{query}")
  end
end
