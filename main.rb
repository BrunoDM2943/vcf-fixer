class Contact
    attr_accessor :name, :emails, :phones

    def initialize
        @emails = []
        @phones = []
    end

    def to_s
        return "Name: #{@name} - Emails: #{@emails} - Phones: #{@phones}"
    end

    def add_email(email)
        @emails.push(email)
    end

    def add_phone(phone)
        @phones.push(phone)
    end
end

def is_begin_card?(line)
    line.include? "BEGIN:VCARD"
end

def is_end_card?(line)
    line.include? "BEGIN:VCARD"
end

def is_name?(line)
    line.include? "FN:"
end

def is_email?(line)
    line.include? "EMAIL;type=INTERNET;"
end

def is_phone?(line)
    line.include? "TEL;"
end

contacts=[]
contact = Contact.new
File.foreach("data.vcf") { |line|
    if is_begin_card? line
        contact = Contact.new
    end
    if is_name? line
        contact.name = line.split(":")[1].strip
    end
    if is_email? line
        contact.add_email(line.split(":")[1].strip)
    end
    if is_phone? line
        contact.add_phone(line.split(":")[1].strip)
    end
    if is_end_card? line
        contacts.push(contact)
    end
}



contacts.each { |c| 
    c.phones = c.phones.map { |phone| 
        phone.gsub(/[-,\(,\)]/,"").gsub(" ","")
    }.uniq
    c.emails = c.emails.uniq
}
contacts.each {|contact| puts contact}