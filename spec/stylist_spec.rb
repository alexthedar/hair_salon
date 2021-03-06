require('spec_helper')

describe(Stylist) do

  describe('#s_name') do
    it("returns the name of a stylist") do
      stylist = Stylist.new(s_name: "Zoolander", id: nil)
      expect(stylist.s_name()).to(eq("Zoolander"))
    end
  end

  describe("#id") do
    it("returns the id") do
      stylist = Stylist.new(s_name: "Zoolander", id: 1)
      expect(stylist.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID number") do
      stylist = Stylist.new(s_name: "Zoolander",  id: nil)
      stylist.save()
      stylist2 = Stylist.new(s_name: "Hansel",  id: nil)
      stylist2.save()
      expect(Stylist.find(stylist.id())).to(eq(stylist))
    end
  end

  describe('#==') do
    it("is the same if the stylist name and id is the same") do
      stylist = Stylist.new(s_name: "Zoolander",  id: nil)
      stylist2 = Stylist.new(s_name: "Zoolander",  id: nil)
      expect(stylist).to(eq(stylist2))
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new(s_name: "Zoolander",  id: nil)
      stylist.save()
      stylist.update({s_name: "Hansel"})
      expect(stylist.s_name()).to(eq("Hansel"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new(s_name: "Zoolander",  id: nil)
      stylist.save()
      stylist2 = Stylist.new(s_name: "Hansel",  id: nil)
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe("#all_clients") do
    it("finds all clients with a matching stylist id and returns an array of the clients") do
      stylist = Stylist.new(s_name: "Zoolander",  id: nil)
      stylist.save()
      id = stylist.id()
      client = Client.new(c_name: "Bob", stylist_id: id, id: nil)
      client.save()
        expect(stylist.all_clients()).to(eq([client]))
    end
  end

  describe("#not_clients") do
    it("finds all clients with a that are not matched with the stylist") do
      stylist = Stylist.new(s_name: "Zoolander",  id: nil)
      stylist.save()
      id = stylist.id()
      client = Client.new(c_name: "Bob", stylist_id: id, id: nil)
      client.save()
      client2 = Client.new(c_name: "Dan", stylist_id: 2, id: nil)
      client2.save()
      expect(stylist.not_clients()).to(eq([client2]))
    end
  end

end
