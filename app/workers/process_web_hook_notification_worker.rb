class ProcessWebHookNotificationWorker
  include Sidekiq::Worker

  def perform(params)
    account_record = Account.where(name: params[:message][:account_name]).first_or_create
    # Log the webhook
    WebHookNotification.create({
      account_id: account_record.id,
      message_text: params[:message][:text],
      message_occurred_at: Time.iso8601(params[:message][:timestamp]),
      # Logging the raw request in case we want to parse this data differently later or debug
      raw_body_of_webhook_request: params.to_s
    })

    # Process the words
    words_in_message = params[:message][:text].scan(/[\w']+/)
    words_in_message.each do |word|
      word_record = Word.where(text: word).first_or_create
      account_word = AccountWord.where(account_id: account_record.id, word_id: word_record.id).first_or_create
      account_word.increment!(:total_count)
    end
  end
end
