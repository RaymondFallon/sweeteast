# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Theater.where(code: 'pgt').first_or_create(name: 'Princeton Garden Theatre',
                                           external_url: 'https://www.princetongardentheatre.org/',
                                           address: '160 Nassau St, Princeton, NJ 08542',
                                           zip_code: '08542')
Theater.where(code: 'delsea').first_or_create(name: 'Delsea Drive-In',
                                              external_url: 'https://www.delseadrive-in.com/',
                                              address: '2203 S Delsea Dr, Vineland, NJ 08360',
                                              zip_code: '08360')
Theater.where(code: 'smod').first_or_create(name: 'Smodcastle Cinemas',
                                            external_url: 'https://www.smodcastlecinemas.com/',
                                            address: '123 Main St, Red Bank, NJ 07701',
                                            zip_code: '07701')

