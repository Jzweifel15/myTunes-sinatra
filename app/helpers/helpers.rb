class Helper
    
      def self.is_logged_in?(session_hash)
        !!session_hash[:user_id]
      end

end