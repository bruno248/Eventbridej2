class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new

    @user = current_user
    @product = Event.find_by(id: params[:event_id])
    @amount = @product.price
    @stripe_amount = (@amount * 100).to_i
  end

  def create
    # Before the rescue, at the beginning of the method  

    @user = current_user
    @product = Event.find_by(id: params[:event_id]) #Product.first
    @amount = @product.price
    @stripe_amount = (@amount * 100).to_i

    begin 
    
      customer = Stripe::Customer.create({  
      email: params[:stripeEmail],  
      source: params[:stripeToken],  
      }) 
      
      charge = Stripe::Charge.create({  
      customer: customer.id,  
      amount: @stripe_amount,  
      description: "Achat d'un produit",  
      currency: 'eur',  
      })
      
      rescue Stripe::CardError => e  
      flash[:error] = e.message  
      redirect_to new_order_path  
    
    end
    #After the rescue, if the payment succeeded

    Attendance.create(event_id: @product.id,
      participant_id: current_user.id)
  end


end


# Attendance.create(event_id: @product.id,
#   participant_id: current_user.id,
#   stripe_customer_id: customer.id)