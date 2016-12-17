require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('pry')
require('./lib/brand')
require('./lib/store')

get('/') do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

# STORE

get('/stores/:id') do
  @store = Store.find(params[:id].to_i)
  @brands = Brand.all
  erb :store
end

post('/stores') do
  name = params[:store_name]
  Store.create({name: name})
  redirect('/')
end

get('/stores/:id/edit') do
  @store = Store.find(params[:id].to_i)
  erb :stores_edit
end

patch('/stores/:id') do
  name = params.fetch("store_update")
  @store = Store.find(params[:id].to_i)
  @store.update({:name => name})
  redirect('/')
end

delete('/stores/:id') do
  @store = Store.find(params[:id].to_i)
  @store.delete
  @stores = Store.all
  redirect('/')
end

#BRAND

post('/brands') do
  name = params[:brand_name]
  Brand.create({name: name})
  @brands = Brand.all
  redirect('/')
end

post('/stores/:id/') do
  name = params[:brand]
  @brands = Brand.all
  @store = Store.find(params[:store_id].to_i)
  new_brand = Brand.where({name: name})
  @store.brands.push(new_brand)
  erb :store
end
