class PsOne::ZeroDivisionController < ApplicationController
  def index
    @divideByZero = "No Divide by Zero.";
    begin
      logger.debug "About to divide by zero"
      @hello = 1/0;
    rescue ZeroDivisionError
      @divideByZero = "Divide by Zero Exception ocured";
    end
  end
end
