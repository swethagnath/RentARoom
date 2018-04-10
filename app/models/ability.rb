class Ability 
  include CanCan::Ability
  def initialize(user)
        if user.nil?
            can :read,[Room,Amenity,City]
        elsif user.role?("admin")
            can :manage,[Room,Amenity,Role,City]
        elsif user.role?("host")
            can :read,[Room,Amenity,City,Review]
            can :create,[Room]
            can [:destroy,:update],Room do |room|
                room.user_id == user.id
            end
        elsif user.role?("guest")
            can :read,[Room,Amenity,City]
            can :create,[Room]
        end
  end
end
