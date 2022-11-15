class Contacts

  def initialize(entries)
    @entries = entries
  end

  def contacts_list
    @contacts = []
    contacts_gather
    return @contacts
  end

  def contacts_gather
    @entries.each do |entry|
      contacts_check(entry)
    end
  end

  def contacts_check(entry)
    (entry.scan(/0[0-9]{10}/)).each do |contact|
      @contacts.push(contact)
    end
  end

end

