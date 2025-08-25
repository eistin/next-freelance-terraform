output "nextjs_portfolio_url" {
  description = "URL of the NextJS Portfolio CloudRun service"
  value       = module.nextjs_portfolio.service_url
}

output "nextjs_portfolio_service_name" {
  description = "Name of the NextJS Portfolio CloudRun service"
  value       = module.nextjs_portfolio.name
}