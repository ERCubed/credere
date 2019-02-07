module Credere
  # == Security:
  # Only GET requests are supported. You should ensure that your application
  # controller enforces its own authentication and authorization, which this
  # controller will inherit.
  #

  class ReportsController <  Credere::ApplicationController
    unloadable

    # @example
    #   GET /reports/balance_sheet
    def balance_sheet
      first_entry = Credere::Entry.order('date ASC').first
      @from_date = first_entry ? first_entry.date: Date.today
      @to_date = params[:date] ? Date.parse(params[:date]) : Date.today
      @assets = Credere::Asset.all
      @liabilities = Credere::Liability.all
      @equity = Credere::Equity.all

      respond_to do |format|
        format.html # index.html.erb
      end
    end

    # @example
    #   GET /reports/income_statement
    def income_statement
      @from_date = params[:from_date] ? Date.parse(params[:from_date]) : Date.today.at_beginning_of_month
      @to_date = params[:to_date] ? Date.parse(params[:to_date]) : Date.today
      @revenues = Credere::Revenue.all
      @expenses = Credere::Expense.all

      respond_to do |format|
        format.html # index.html.erb
      end
    end

  end
end
