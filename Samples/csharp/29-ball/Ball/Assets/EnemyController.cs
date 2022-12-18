using UnityEngine;

public class EnemyController : MonoBehaviour
{
    public float forceScale = 0.2f;
    
    private Rigidbody _rigidBody;
    private BallController _target;
    
    void Start()
    {
        _rigidBody = GetComponent<Rigidbody>();
        _target = FindObjectOfType<BallController>();
    }
    
    void Update()
    {
        Vector3 vectorTowardTarget = (_target.transform.position - transform.position).normalized;
        vectorTowardTarget.y = 0.0f;
        
        _rigidBody.AddForce(vectorTowardTarget * forceScale);
    }
}
