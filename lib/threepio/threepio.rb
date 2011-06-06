module Threepio
  extend self

  def use(engine, params = {})
    if engine.is_a? Symbol
      unless @engines.include? engine
        raise StandardError, "engine not registered"
      end

      @engine = @engines[engine]
    else
      @engine = engine
    end

    if params.length > 0
      params.each do |param, value|
        @engine.send(param, value)
      end
    end

    if block_given?
      yield @engine
    end

    self
  end

  def registers(engine, params = {})
    as = params[:as] || engine.name.downcase.to_sym

    @engines ||= {}
    @engines[as] = engine
  end

  def translate(phrase, params)
    raise StandardError, "missing to" unless params.include? :to

    @engine.translate phrase, :to => params[:to], :from => params[:from]
  end
end
