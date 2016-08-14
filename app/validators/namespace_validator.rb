class NamespaceValidator < ActiveModel::EachValidator

  WORDS = %w{
    about account admin all
    contact
    following followers friend
    help home
    list login logout
    privacy profile
    retweet rule
    search session setting signup signin
    terms trend
    tweet twitter
    user
  }
  def validate_each(record, attribute, value)
    if (WORDS + WORDS.map {|w| w.pluralize}).include?(value)
      record.errors[attribute] <<
        (options[:message] || ('is a reserved name'))
    end
  end
end
