class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def user_scope
      @scope.where({ baskets: { user_id: @user.id }})
    end

    def visitor_scope # not logged in
      @scope.none
    end

    def resolve
      case @user
      when User
        user_scope
      else
        visitor_scope
      end
    end
  end
end
