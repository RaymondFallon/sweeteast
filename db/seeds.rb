
## Theaters

[['pgt', 'Princeton Garden Theatre', 'https://www.princetongardentheatre.org/',
          '160 Nassau St, Princeton, NJ 08542', '08542'],
 ['delsea', 'Delsea Drive-In', 'https://www.delseadrive-in.com/',
            '2203 S Delsea Dr, Vineland, NJ 08360', '08360'],
 ['smodcastle', 'Smodcastle Cinemas', 'https://www.smodcastlecinemas.com/',
         '123 Main St, Red Bank, NJ 07701', '07701'],
 ['barrymore', 'Barrymore Film Center', 'https://www.barrymorefilmcenter.com/',
         '209 Monmouth St, Red Bank, NJ 07701', '07701'],
 ['clairidge', 'Clairidge', 'https://theclairidge.org/',
         '486 Bloomfield Ave, Montclair, NJ 07042', '07042'],
 ['showroom', 'Showroom Cinemas', 'https://showroomcinemas.com/',
         '707 Cookman Ave, Asbury Park, NJ 07712', '07712'],
 ['williams', 'Williams Center', 'https://www.williamscenter.co/cinema-underground',
         '1 Williams Plaza, Rutherford, NJ 07070', '07070'],
 ['montgomery', 'Montgomery Cinemas', 'https://www.montgomerycinemas.com/',
         '1325 US-206, Skillman, NJ 08558', '08558']].each do |code, name, url, address, zip_code|
  Theater.where(code: code).first_or_create(name: name, external_url: url, address: address, zip_code: zip_code)
end

ray = Author.where(name: 'Ray Fallon').first_or_create
Article.where(author: ray).first_or_create(title: 'Coming Soon', published_at: 1.day.ago)
