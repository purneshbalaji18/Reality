from supabase import create_client, Client
from typing import Optional
from app.config import settings


class SupabaseClientManager:
    """Supabase Database Client Connection Manager"""

    def __init__(self):
        self.client: Optional[Client] = None
        self._initialize()

    def _initialize(self):
        if settings.supabase_url and settings.supabase_key:
            try:
                self.client = create_client(settings.supabase_url, settings.supabase_key)
                print("[SupabaseManager] Connected to Supabase.")
            except Exception as e:
                print(f"[SupabaseManager] Failed to connect: {e}")
        else:
            print("[SupabaseManager] SUPABASE_URL or SUPABASE_KEY not set. Running with seed memory fallback.")

    def get_client(self) -> Optional[Client]:
        return self.client


supabase_manager = SupabaseClientManager()
