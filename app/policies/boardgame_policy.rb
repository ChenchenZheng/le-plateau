class BoardgamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def import_boardgame?
    true
  end

  def scan_barcode?
    true
  end
end
