using UnityEngine;

public class BallController : MonoBehaviour
{
    public float forceScale = 0.3f;
    
    private Rigidbody _rigidBody;
    
    void Start()
    {
        _rigidBody = GetComponent<Rigidbody>();
    }

    void Update()
    {
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");
        
        _rigidBody.AddForce(new Vector3(-x, 0.0f, -z) * forceScale);
    }
}
