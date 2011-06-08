module A
  def self.f
    p 'one'
  end
end

module A
  class << self
    def new_f
      old_f
      p 'two'
    end
    alias_method :old_f, :f
    alias_method :f, :new_f
  end
end

A.f