# Create SNS Topic
resource "aws_sns_topic" "asg_notifications" {
  name = "auto-scaling-group-notifications"

  tags = {
    Name = "ASG Notifications"
  }
}

# Create Email Subscription
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.asg_notifications.arn
  protocol  = "email"
  endpoint  = var.notification_email # Replace with your email address
}
