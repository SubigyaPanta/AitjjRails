class PsOne::ZeroDivisionController < ApplicationController
  def index
    @divideByZero = "No Divide by Zero.";
    begin
      logger.error "About to divide by zero"
      @hello = 1/0;
    rescue ZeroDivisionError => ex
      @divideByZero = "Divide by Zero Exception ocured"
      @trace = ex.backtrace.join("\r\n")
    end
  end
end
