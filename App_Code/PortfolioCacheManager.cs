using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    /// <summary>
    /// Cache manager for portfolio data to ensure real-time updates
    /// </summary>
    public static class PortfolioCacheManager
    {
        private static readonly string CACHE_KEY_PREFIX = "Portfolio_";
        
        /// <summary>
        /// Clear all portfolio-related cache when admin makes changes
        /// </summary>
        public static void ClearAllCache()
        {
            try
            {
                if (HttpContext.Current != null && HttpContext.Current.Cache != null)
                {
                    var cache = HttpContext.Current.Cache;
                    var keysToRemove = new List<string>();
                    
                    // Find all cache keys that start with our prefix
                    var enumerator = cache.GetEnumerator();
                    while (enumerator.MoveNext())
                    {
                        string key = enumerator.Key.ToString();
                        if (key.StartsWith(CACHE_KEY_PREFIX))
                        {
                            keysToRemove.Add(key);
                        }
                    }
                    
                    // Remove all portfolio-related cache entries
                    foreach (string key in keysToRemove)
                    {
                        cache.Remove(key);
                    }
                    
                    System.Diagnostics.Debug.WriteLine($"Cleared {keysToRemove.Count} portfolio cache entries.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error clearing portfolio cache: {ex.Message}");
            }
        }
        
        /// <summary>
        /// Clear specific cache entry
        /// </summary>
        public static void ClearCache(string key)
        {
            try
            {
                if (HttpContext.Current != null && HttpContext.Current.Cache != null)
                {
                    string fullKey = CACHE_KEY_PREFIX + key;
                    HttpContext.Current.Cache.Remove(fullKey);
                    System.Diagnostics.Debug.WriteLine($"Cleared cache for key: {fullKey}");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error clearing cache for key {key}: {ex.Message}");
            }
        }
        
        /// <summary>
        /// Get cached data
        /// </summary>
        public static T GetCache<T>(string key) where T : class
        {
            try
            {
                if (HttpContext.Current != null && HttpContext.Current.Cache != null)
                {
                    string fullKey = CACHE_KEY_PREFIX + key;
                    return HttpContext.Current.Cache[fullKey] as T;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error getting cache for key {key}: {ex.Message}");
            }
            return null;
        }
        
        /// <summary>
        /// Set cached data
        /// </summary>
        public static void SetCache<T>(string key, T data, TimeSpan expiration) where T : class
        {
            try
            {
                if (HttpContext.Current != null && HttpContext.Current.Cache != null && data != null)
                {
                    string fullKey = CACHE_KEY_PREFIX + key;
                    HttpContext.Current.Cache.Insert(
                        fullKey, 
                        data, 
                        null, 
                        DateTime.UtcNow.Add(expiration), 
                        TimeSpan.Zero
                    );
                    System.Diagnostics.Debug.WriteLine($"Cached data for key: {fullKey}");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error setting cache for key {key}: {ex.Message}");
            }
        }
    }
}